defmodule EctoQueries.Repo.Migrations.AddAlbumSong do
  use Ecto.Migration

  def change do
    create table(:album) do
      add(:name, :string, length: 255)
      add(:length, :integer, length: 10)
    end

    create table(:song) do
      add(:name, :string, length: 255)
      add(:length, :integer, length: 10)
      add(:album_id, references(:album))
    end
  end
end
