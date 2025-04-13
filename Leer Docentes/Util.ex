defmodule Util do

  def mostrarMensaje(mensaje) do
    IO.puts(mensaje)
  end

  def ingresar(mensaje, :texto) do  ## :texto es un atomo que se utiliza como mensaje de retorno
    mensaje
    |> IO.gets()
    |> String.trim()

  end

  def mostrarError(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  defp ingresar(mensaje, parser, tipoDato) do
    try do
      mensaje
      |>ingresar(:texto)
      |>parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número #{tipoDato} \n"
        |> mostrarError()

        mensaje
        |> ingresar(parser, tipoDato)

      end
  end

  def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)
  def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)

  def ingresar(mensaje, :boolean) do
    valor=
    mensaje
    |>ingresar(:texto)
    |>String.downcase()
    Enum.member?(["s", "si", "sí"], valor)
  end
end
