<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;

class NewCustomSizeRequestNotification extends Notification
{
    use Queueable;

    protected $productName;
    protected $customSize;
    protected $messageContent;
    protected $customerName;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($productName, $customSize, $messageContent, $customerName)
    {
        $this->productName = $productName;
        $this->customSize = $customSize;
        $this->messageContent = $messageContent;
        $this->customerName = $customerName;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('New Message: Custom Size Request')
            ->greeting('Dear ' . $this->customerName . ',')
            ->line('We hope this email finds you well.')
            ->line('You have received a new message regarding your recent custom size request. Here are the details:')
            ->line('Product: ' . $this->productName)
            ->line('Custom Size: ' . $this->customSize)
            ->line('Message: ' . $this->messageContent)
            ->line('Soon you get notified for availablility as per shared size for the product: '.$this->productName)
            ->line('Please review the message and respond accordingly. If you have any questions or need further assistance, feel free to contact our customer support team.')
            ->line('Thank you for choosing '.env('APP_NAME').' for your custom sizing needs.')
            ->salutation('Best regards, '.env('APP_NAME').'');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
