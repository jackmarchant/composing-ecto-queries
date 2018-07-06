defmodule EctoQueries do
  @moduledoc """
  Composing Ecto Queries.
  """

  alias EctoQueries.{Repo, Song, Album}

  import Ecto.Query

  @doc """
  Find all songs with length greater than `length`
  """
  @spec find_songs_longer_than(integer()) :: list(Song.t())
  def find_songs_longer_than(length) do
    Song
    |> where([song], song.length > ^length)
    |> find_all()
  end

  @doc """
  Find songs by their album name
  """
  @spec find_songs_by_album_name(String.t()) :: list(Song.t())
  def find_songs_by_album_name(name) do
    Song
    |> join(:inner, [song], album in Album, song.album_id == album.id)
    |> where([_, album], album.name == ^name)
    |> find_all()
  end

  @doc """
  Find albums with songs longer than `length`
  Includes all songs in that album, with Repo.preload/3
  """
  @spec find_albums_with_songs_longer_than(integer()) :: list(Album.t())
  def find_albums_with_songs_longer_than(length) do
    Album
    |> compose_albums_with_song_length(length)
    |> distinct([a], a.id)
    |> find_all()
    |> Repo.preload([:songs])
  end

  @doc """
  Find all songs
  """
  @spec find_songs :: list(Song.t())
  def find_songs do
    find_all(Song)
  end

  @doc """
  Find all albums
  """
  @spec find_albums :: list(Album.t())
  def find_albums do
    find_all(Album)
  end

  defp compose_albums_with_song_length(queryable, length) do
    queryable
    |> join(:inner, [album], song in Song, album.id == song.album_id)
    |> where([_, s], s.length > ^length)
  end

  defp find_all(queryable) do
    Repo.all(queryable)
  end
end
