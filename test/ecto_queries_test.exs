defmodule EctoQueriesTest do
  use ExUnit.Case

  alias Ecto.Adapters.SQL.Sandbox
  alias EctoQueries.{Repo, Seeder}

  describe "EctoQueries" do
    setup do
      :ok = Sandbox.checkout(Repo)
      :ok = Seeder.run()
    end
  end

  test "find_songs/0" do
    songs = EctoQueries.find_songs()

    assert length(songs) == 3
  end

  test "find_albums/0" do
    albums = EctoQueries.find_albums()

    assert length(albums) == 1
  end

  test "find_songs_longer_than/1" do
    songs = EctoQueries.find_songs_longer_than(170)

    assert length(songs) == 2

    assert false not in Enum.map(songs, fn song ->
             Map.get(song, :length) > 170
           end)
  end

  test "find_songs_by_album_name/1" do
    songs = EctoQueries.find_songs_by_album_name("The Beatles Greatest Hits")

    assert length(songs) == 3
  end

  test "find_albums_with_songs_longer_than/1" do
    albums = EctoQueries.find_albums_with_songs_longer_than(170)

    [album | _] = albums

    assert album.name == "The Beatles Greatest Hits"
    assert length(album.songs) == 3
  end
end
