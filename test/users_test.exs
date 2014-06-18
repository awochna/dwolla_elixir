defmodule UsersTest do 
  use ExUnit.Case
 
  import DwollaElixir.Client
  import Mock
  
  test_with_mock "should get users by id", HTTPoison,
   [get: fn(_url) -> basic_user()  end] do
      assert basic_user() == DwollaElixir.Users.get("reflector@dwolla.com", client(key: "key", secret: "secret"))  
  end
   
  def basic_user() do
    JSON.encode [
    Success: true, 
    Message: "Success", 
    Response: JSON.encode! [
      Id: "812-111-1111",
      Latitude: 41.584546,
      Longitude: -93.634167,
      Name: "Test User"
      ]
    ]  
  end

end
