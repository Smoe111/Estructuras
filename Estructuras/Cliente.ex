defmodule Cliente do

  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def ingresar(mensaje) do
    mensaje
    |>Util.mostrarMensaje()

    nombre= "Ingrese su nombre: "
    |>Util.ingresar(:texto)

    edad = "Ingrese su edad: "
    |>Util.ingresar(:entero)

    altura = "Ingrese su altura: "
    |>Util.ingresar(:real)

    crear(nombre, edad, altura)
  end

  def ingresar(mensaje, :cliente) do
    mensaje
    |> ingresar([], :cliente)

  end

  defp ingresar(mensaje, lista, :cliente) do

    cliente= mensaje
    |>ingresar()

    nueva_lista = lista ++ [cliente]

    mas_clientes= "\n Ingresar más clientes (S/N): "
    |>Util.ingresar(:boolean)

    case mas_clientes do
      true ->
        mensaje
        |> ingresar(nueva_lista, :cliente)
      false ->
        nueva_lista
    end
  end

  def generar_mensaje( cliente) do
    altura = cliente.altura
    |>Float.round(2)
    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y tienes una altura de #{altura} metros \n"

  end

  def generar_mensaje_clientes(lista_clientes, parser ) do
    lista_clientes
    |>Enum.map(parser)
    |>Enum.join("\n")
   end

   defp convertir_cliente_linea_csv(cliente) do
    "#{cliente.nombre}, #{cliente.edad}, #{cliente.altura}"

  end

   def escribir_csv(clientes, nombre) do

    clientes
    |>generar_mensaje_clientes(&convertir_cliente_linea_csv/1)
    |>(&("nombre, edad, altura \n " <> &1)).() #titulo del cvs
    |>(&File.write( nombre, &1)).()

   end

   defp convertir_cadena_cliente(cadena) do

    [nombre, edad, altura] = cadena
    |> String.split(",")
    |> Enum.map(&String.trim/1)
    edad = edad |> String.to_integer()
    altura = altura |> String.to_float()
    Cliente.crear(nombre, edad, altura)
    end

   def leer_csv(nombre) do
    nombre
    |> File.stream!()
    |> Stream.drop(1)  # ignora los encabezados
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&convertir_cadena_cliente/1)  # Filtrar valores nil

    end

end
