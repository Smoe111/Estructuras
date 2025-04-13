defmodule EstructuraDocente do

  def main do

  "Docentes_Uniquindio_20240817.csv"
  
  |> CSV.leer_csv(&Docente.convertir_cadena_docente/1)
  |> Enum.filter(&(&1.formacion == "MAESTRIA" and &1.vinculacion == "PLANTA"))
  |> CSV.generar_mensaje_csv(&generar_mensaje/1)
  |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(docente) do
    "#{docente.periodo}, #{docente.formacion}, #{docente.vinculacion}"
  end


end

EstructuraDocente.main()
