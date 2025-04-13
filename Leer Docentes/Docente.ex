defmodule Docente do

  defstruct  periodo: "",
   facultad: "", programa: "", genero: "", formacion: "", vinculacion: "", dedicacion: "",
   cargo: "", categoria: ""

   def crear(periodo, facultad, programa, genero, formacion, vinculacion, dedicacion, cargo, categoria) do

    %Docente{periodo: periodo, facultad: facultad, programa: programa, genero: genero,
      formacion: formacion, vinculacion: vinculacion, dedicacion: dedicacion,
      cargo: cargo, categoria: categoria}

  end

  def generar_mensaje_docente(lista_docentes, parser) do
    lista_docentes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  defp convertir_cadena_docente(cadena) do

    [periodo, facultad, programa, genero, formacion, vinculacion, dedicacion, cargo, categoria] =
      cadena
      |>String.split(",")
      |>Enum.map(&String.trim/1)

      Docente.crear(periodo, facultad, programa, genero, formacion, vinculacion, dedicacion, cargo, categoria)

  end

  def leer_csv(nombre_archivo) do
    nombre_archivo
    |> File.stream!()
    |> Stream.drop(1) # Eliminar la primera línea (encabezados)
    |> Enum.map(&convertir_cadena_docente/1)
  end


end
