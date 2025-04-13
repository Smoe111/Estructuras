defmodule Estructura do
  def main do

    "Docentes_Uniquindio_20250413.csv"
    |> Docente.leer_csv()
    |> filtrar_datos()
  end
end
