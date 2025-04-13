defmodule Estructuras do

  def main do

    crear_lista_clientes()
    |>Cliente.generar_mensaje_clientes(&generar_mensaje/1)
    |>Util.mostrarMensaje()

    "Ingrese los datos del cliente: "
    |> Cliente.ingresar(:cliente)
    |> Cliente.escribir_csv("clientes.csv")

  end

  defp generar_mensaje( cliente) do
    altura = cliente.altura
    |>Float.round(2)
    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y "<>"tienes una altura de #{altura} metros \n"

  end

  defp generar_mensaje_clientes (lista_clientes) do
   lista_clientes
   |>Enum.map(&generar_mensaje/1)
    |>Enum.join()
  end

  defp crear_lista_clientes do
   [Cliente.crear("Ana", 16, 1.70),
    Cliente.crear("Juan", 20, 1.72),
    Cliente.crear("Diana", 48, 1.71),
    Cliente.crear("Julian", 51, 1.73),
    Cliente.crear("Isabella", 6, 1.00),
    Cliente.crear("Sara", 8, 1.30)]
  end

  defp filtrar_datos(datos) do

    datos
    |> Enum.filter(fn (cliente) -> cliente.edad < 21 end)

  end


end

Estructuras.main()
