defmodule Tatumex do
  @moduledoc """
  Documentation for `Tatumex`.
  """

  @doc """
  Creates Wallet given a currency
  ## Paramenters
    - currency: atom than represents the currency

    Returns `{:ok, xpub}`

  ## Examples

      - iex> Tatumex.create_wallet(:bitcoin)
  """
  @spec create_wallet(atom)::tuple
  def create_wallet(currency) do
    url = Tatumex.Utils.create_url currency, "wallet"
    {:ok, value} = Tatumex.Utils.make_request "xpub", url
    {:ok, value}
  end

  @doc """
  Creates Wallet Address given a currency
  ## Paramenters
    - currency: atom than represents the currency
  Returns `{:ok, address}`

  ## Examples

      iex> Tatumex.create_address(:bitcoin)
  """

  @spec create_address(atom)::tuple
  def create_address(currency) do
    {:ok, xpub} = create_wallet currency
    url = Tatumex.Utils.create_url currency, "address", "#{xpub}/1"
    {:ok, value } = Tatumex.Utils.make_request "address", url
    {:ok, value}
  end
end
