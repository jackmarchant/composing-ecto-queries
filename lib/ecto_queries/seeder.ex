defmodule EctoQueries.Seeder do
  alias EctoQueries.{Album, Song, Repo}

  def run do
    Repo.delete_all(Song)
    Repo.delete_all(Album)

    album =
      Repo.insert!(%Album{
        name: "The Beatles Greatest Hits",
        length: 255
      })

    Repo.insert!(%Song{
      name: "Here Comes The Sun",
      length: 186,
      album_id: album.id
    })

    Repo.insert!(%Song{
      name: "A Hard Day's Night",
      length: 169,
      album_id: album.id
    })

    Repo.insert!(%Song{
      name: "Let It Be",
      length: 243,
      album_id: album.id
    })

    :ok
  end
end
