class ContactMailer < ApplicationMailer

    def send_contact_email()
        # email = ENV.fetch('SYSTEM_EMAIL')

        # @service_title = booking_info[:service_title]
        # @check_in = booking_info[:name]
        
        date = Time.now.strftime("%B %d, %Y, %d")
        subject = "New booking request #{date}"
        mail(to: 'pitsakis@gmail.com', subject: subject, from: 'pitsakis@gmail.com')
    end

end
