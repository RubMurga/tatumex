defmodule Tatumex.Utils do
  def create_headers do
    ["x-api-key":  Application.get_env(:tatumex, :tatum_api_key)]
  end

  def create_url(currency, endpoint) do
    currency_string = Atom.to_string(currency)
    "#{Application.get_env(:tatumex, :tatum_url)}/#{currency_string}/#{endpoint}"
  end

  def create_url(currency, endpoint, extra_params) do
    currency_string = Atom.to_string(currency)
    "#{Application.get_env(:tatumex, :tatum_url)}/#{currency_string}/#{endpoint}/#{extra_params}"
  end

  def make_request(key, url)  do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url, create_headers())
    {:ok, body_decoded} = Poison.decode(body)
    {:ok, body_decoded[key]}
  end
end
