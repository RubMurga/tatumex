defmodule Tatumex do
  @moduledoc """
  Documentation for `Tatumex`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tatumex.hello()
      :world

  """
  defp create_headers do
    ["x-api-key":  Application.get_env(:tatumex, :tatum_api_key)]
  end

  defp create_url(currency, endpoint) do
    currency_string = Atom.to_string(currency)
    "#{Application.get_env(:tatumex, :tatum_url)}/#{currency_string}/#{endpoint}"
  end

  defp create_url(currency, endpoint, extra) do
    currency_string = Atom.to_string(currency)
    "#{Application.get_env(:tatumex, :tatum_url)}/#{currency_string}/#{endpoint}/#{extra}"
  end

  def create_wallet(currency) do
    url = create_url currency, "wallet"
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url, create_headers())
    {:ok, body_decoded} = Poison.decode(body)
    {:ok, body_decoded["xpub"]}
  end

  def create_address(currency) do
    {:ok, xpub} = create_wallet currency
    url = create_url currency, "address", "#{xpub}/1"
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url, create_headers())
    {:ok, body_decoded} = Poison.decode(body)
    {:ok, body_decoded["address"]}
  end
end
