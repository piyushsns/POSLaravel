<?php

namespace App\Notifications;

use App\LiveDemoAppointment;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class LiveDemoAppointmentNotification extends Notification
{
    use Queueable;

    private $liveDemoAppointment;
    public function __construct(LiveDemoAppointment $liveDemoAppointment)
    {
        $this->liveDemoAppointment = $liveDemoAppointment;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $calendarUrl = route('calendar-event', ['appointment' => $this->liveDemoAppointment->id]);

        return (new MailMessage)
            ->subject('New Live Demo Appointment Scheduled!')
            ->line($this->liveDemoAppointment->customer ? $this->liveDemoAppointment->customer->name : $this->liveDemoAppointment->first_name.' '.$this->liveDemoAppointment->last_name)
            ->line('Hope you are doing well!')
            ->line('Your new live demo appointment has been scheduled for the item are looking: ' . ($this->liveDemoAppointment->product_flat ? $this->liveDemoAppointment->product_flat : $this->liveDemoAppointment->what_are_you_looking_for))
            ->line('Appointment Date: ' . date("m/d/Y", strtotime($this->liveDemoAppointment->appointment_date)))
            ->line('Appointment Time: ' . date("h:i A", strtotime("01/01/2000 " . $this->liveDemoAppointment->appointment_time)))
            ->line('To view appointment visit follow the url: '. env('FRONTEND_URL') ."/page/account/live_demo/appointments/".$this->liveDemoAppointment->id)
            ->line('Please join live demo via following link: '. env('MiroTalkURL')."LiveDemo-".$this->liveDemoAppointment->id)
            ->action('Add to Calendar', $calendarUrl);
    }

    public function toArray($notifiable)
    {
        return [
            // Additional data to be sent with the notification if needed
        ];
    }
}
