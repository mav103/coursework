module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Начальная страница',
      :icon => 'list',
      :controller => :welcome,
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'Больница',
      :icon => 'bookmark',
      :children => [
      {:name => 'Палаты',
       :controller => :wards, :action => :index,
       :icon => 'inbox',
       :class => 'long'},
      {:name => 'Амбулаторные периоды',
       :controller => :surveys, :action => :index,
       :icon => 'book',
       :class => 'long'},
      {:name => 'Карты пациентов',
       :controller => :cards, :action => :index,
       :icon => 'id-card',
       :class => 'long'},
      {:name => 'Результаты исследований',
       :controller => :results, :action => :index,
       :icon => 'list-ul',
       :class => 'long'}
    ]}
    result
  end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
