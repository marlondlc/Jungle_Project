class ExampleMailer < ApplicationMailer
  default from: "no-reply@jungle.com"


  def sample_email(order)
    @order = order
    mail(to: @order.email, subject: `Confirmtation Email - Here is a Copy of your #{order.id}` )
  end


end


