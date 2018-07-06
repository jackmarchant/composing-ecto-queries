defmodule EctoQueries.Album do
  use Ecto.Schema

  alias EctoQueries.Song

  schema "album" do
    field(:name, :string)
    # represents number of minutes
    field(:length, :integer)
    has_many(:songs, Song)
  end
end
