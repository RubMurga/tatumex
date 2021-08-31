defmodule TatumexTest do
  use ExUnit.Case
  doctest Tatumex

  test "should create a wallet" do
    assert {:ok, _} = Tatumex.create_wallet(:ethereum)
  end

  test "should create an address" do
    assert {:ok, address} = Tatumex.create_address(:ethereum)
    IO.inspect address, label: "Created address"
  end
end
