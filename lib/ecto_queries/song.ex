defmodule EctoQueries.Song do
  use Ecto.Schema

  alias EctoQueries.Album

  schema "song" do
    field(:name, :string)
    # represents number of seconds
    field(:length, :integer)
    belongs_to(:album, Album)
  end
end
