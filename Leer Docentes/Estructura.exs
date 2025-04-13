defmodule Estructura do

  def main do

    "Docentes_Uniquindio_20250413.csv"
    |> Docente.leer_csv()
    |> filtrar_datos()
    |> Docente.generar_mensaje_docente()
    |> Util.mostrarMensaje()
  end

  defp generar_mensaje(docente) do
    "#{docente.periodo}, #{docente.formacion}, #{docente.vinculacion}"
  end

  defp filtrar_datos(datos) do
   datos
   |>Enum.filter(fn(docente)-> docente.formacion == "MAESTRIA" and docente.vinculacion == "PLANTA" end)
  end


end

Estructura.main()
