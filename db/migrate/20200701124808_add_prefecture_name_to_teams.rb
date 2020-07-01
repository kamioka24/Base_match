class AddPrefectureNameToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :prefecture_name, :string # 都道府県順の並び替えと、都道府県名での検索を両立させるために追加。
    # ransackでなければひとつのカラムで条件をつけてもできるかも？
  end
end
