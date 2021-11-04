defmodule Petal.Mailer do
  @moduledoc """
    Includes Swoosh as mailing package
  """
  use Swoosh.Mailer, otp_app: :petal
end
