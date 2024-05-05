<?php

namespace App\Http\Controllers;

use App\LiveDemoAppointment;
use App\Notifications\AdminLiveDemoAppointmentNotification;
use App\Notifications\LiveDemoAppointmentNotification;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Webkul\Customer\Models\Customer;
use Webkul\RestApi\Http\Controllers\V1\Shop\Customer\CustomerController;
use Webkul\User\Models\Admin;

class LiveDemoAppointmentController extends CustomerController
{
    public function getAll()
    {
        $liveDemoAppointments = LiveDemoAppointment::all();
        return response()->json([
            'success' => true,
            'data' => $liveDemoAppointments
        ]);
    }

    public function getOne(LiveDemoAppointment $liveDemoAppointment)
    {
        return response()->json([
            'success' => true,
            'data' => $liveDemoAppointment
        ]);
    }

    public function schedule(Request $request)
    {
        // $customer = $this->resolveShopUser($request);

        $validation = Validator::make($request->all(), [
            'appointment_date' => 'required|date',
            'appointment_time' => 'required|date_format:H:i',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|string',
            'email' => 'required|email',
            'event_type' => 'required|string',
            'what_are_you_looking_for' => 'required|string',
        ]);

        if($validation->fails()) {
            return response()->json([
                "success" => false,
                "message" => "Validation Errors",
                'validation_errors' => $validation->errors()
            ], 422);
        }

        $validatedData = request()->all();
        // Create a new LiveDemoAppointment instance
        $liveDemoAppointment = new LiveDemoAppointment();
        $liveDemoAppointment->customer_id = request()->input('customer_id', null);
        $liveDemoAppointment->product_id = request()->input('product_id', null);
        $liveDemoAppointment->appointment_date = request()->input('appointment_date', null);
        $liveDemoAppointment->appointment_time = request()->input('appointment_time', null);
        $liveDemoAppointment->contact_info = request()->input('contact_info', null);
        $liveDemoAppointment->first_name = request()->input('first_name', null);
        $liveDemoAppointment->last_name = request()->input('last_name', null);
        $liveDemoAppointment->phone = request()->input('phone', null);
        $liveDemoAppointment->email = request()->input('email', null);
        $liveDemoAppointment->event_type = request()->input('event_type', null);
        $liveDemoAppointment->event_type_text = request()->input('event_type_text', null);
        $liveDemoAppointment->what_are_you_looking_for = request()->input('what_are_you_looking_for', null);
        $liveDemoAppointment->status = 'scheduled';
        // Save the appointment
        $liveDemoAppointment->save();
        $liveDemoAppointment->miro_room_id = request()->input('miro_room_id', "LiveDemo-".$liveDemoAppointment->id);
        $liveDemoAppointment->save();

        // Send notification customer
        if ($customer = Customer::find(request()->input('customer_id', null))) {
            $customer->notify(new LiveDemoAppointmentNotification($liveDemoAppointment));
        } else {
            \Notification::route('mail', $validatedData['email'])->notify(new LiveDemoAppointmentNotification($liveDemoAppointment));
        }

        // Send notification admins
        $admins = Admin::where("role_id", 1)->get();
        foreach ($admins as $admin) {
            $admin->notify(new AdminLiveDemoAppointmentNotification($liveDemoAppointment));
        }

        return response()->json([
            'success' => true,
            'message' => 'Live demo scheduled successfully',
            'data' => $liveDemoAppointment],
        201);
    }

    public function downloadCalendarEvent($appointmentId)
{
    $appointment = LiveDemoAppointment::findOrFail($appointmentId);

    // Generate the calendar event in iCalendar format
    $calendarEvent = "BEGIN:VCALENDAR\n";
    $calendarEvent .= "VERSION:2.0\n";
    $calendarEvent .= "PRODID:-//Surya Ethnic International Live Demo//EN\n";
    $calendarEvent .= "BEGIN:VEVENT\n";
    $calendarEvent .= "UID:" . uniqid() . "\n";
    $calendarEvent .= "DTSTAMP:" . Carbon::now()->format('Ymd\THis\Z') . "\n";
    $calendarEvent .= "DTSTART:" . Carbon::parse($appointment->appointment_date . ' ' . $appointment->appointment_time)->format('Ymd\THis\Z') . "\n";
    $calendarEvent .= "DTEND:" . Carbon::parse($appointment->appointment_date . ' ' . $appointment->appointment_time)->addHour()->format('Ymd\THis\Z') . "\n";
    $calendarEvent .= "SUMMARY:Live Demo Appointment\n";
    $calendarEvent .= "DESCRIPTION:A new live demo appointment has been scheduled for items: " . ($appointment->product_flat ?? $appointment->what_are_you_looking_for) . "\n";
    $calendarEvent .= "LOCATION:Online\n";
    $calendarEvent .= "END:VEVENT\n";
    $calendarEvent .= "END:VCALENDAR";

    // Return the calendar event as a downloadable file
    return response()->streamDownload(function () use ($calendarEvent) {echo $calendarEvent;}, 'appointment.ics');
}
}
