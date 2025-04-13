defmodule CSV do

  def leer_csv(nombre_archivo, parser) do
    nombre_archivo
    |> File.stream!()
    |> Stream.drop(1) # Eliminar la primera línea (encabezados)
    |> Enum.map(parser)
  end

  def escribir_cvs(datos, nombre, titulos, parser) do
    datos
    |>generar_mensaje_csv(parser)
    |>(&(titulos <> &1)).()
    |>(&FIle.write(nombre, &1)).()
  end

  def generar_mensaje_csv(datos, parser) do
    datos
    |> Enum.map(parser)
    |> Enum.join("\n")
  end
end
