<?php


namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use App\LiveDemoAppointment;

class AdminLiveDemoAppointmentNotification extends Notification
{
    use Queueable;

    protected $liveDemoAppointment;

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
        return (new MailMessage)
            ->subject('New Live Demo Appointment Scheduled')
            ->line('A new live demo appointment has been scheduled for items: ' . ($this->liveDemoAppointment->product_flat ? $this->liveDemoAppointment->product_flat : $this->liveDemoAppointment->what_are_you_looking_for))
            ->line('Customer Name: ' . $this->liveDemoAppointment->first_name." ".$this->liveDemoAppointment->last_name)
            ->line('Customer Email: ' . $this->liveDemoAppointment->email)
            ->line('Customer Contact: ' . $this->liveDemoAppointment->phone)
            ->line('Appointment Date: ' . date("m/d/Y", strtotime($this->liveDemoAppointment->appointment_date)))
            ->line('Appointment Time: ' . date("h:i A", strtotime("01/01/2000 ".$this->liveDemoAppointment->appointment_time)))
            ->line('Please join live demo via following link: '. env('MiroTalkURL')."LiveDemo-".$this->liveDemoAppointment->id);
    }
}
