<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CustomProductSizeRequestNotification extends Notification
{
    use Queueable;

    private $customProductSize;

    public function __construct($customProductSize)
    {
        $this->customProductSize = $customProductSize;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('New Custom Product Size Added')
            ->line('Hello Admin,')
            ->line('A new custom product size has been added:')
            ->line('Product Name: ' . $this->customProductSize->product_flat->name)
            ->line('Custom Size: ' . $this->customProductSize->custom_size)
            ->line('Custom Size Comments:-')
            ->line($this->customProductSize->custom_size_comments)
            ->line('By The Customer Below:-')
            ->line('Customer Name: ' . $this->customProductSize->customer_name)
            ->line('Customer Email: ' . $this->customProductSize->email);
    }

    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
