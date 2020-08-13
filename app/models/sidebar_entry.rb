class SidebarEntry
  class << self
    include Rails.application.routes.url_helpers
  end

  def self.all
    [
      {
        group_title: '',
        children: [
          {
            href: '#',
            title: '设置',
            icon: 'fa-info-circle',
            children: [
                {
                    href: configs_path,
                    title: '配置',
                },
              {
                href: skillclas_path,
                title: '技能分类',
              },
              {
                  href: skills_path,
                  title: '技能',
              },
              {
                href: evaluatetagdefs_path,
                title: '评价标签定义',
              },
              {
                  href: 'javascript:void(0);',
                  title: '城市',
                  children: [
                      {
                          href: citycodes_path,
                          title: '城市列表',
                      },
                      {
                          href: 'javascript:void(0);',
                          title: '热门城市',
                      },
                  ]
              },
                {
                    href: realnames_path,
                    title: '技工实名',
                },
                {
                    href: tasks_path,
                    title: '任务订单',
                },
                {
                    href: users_path,
                    title: '用户',
                },
                {
                    href: admins_path,
                    title: '管理员',
                },
              {
                href: '#',
                title: 'Build Notes',
                subtitle: "#{Rails.configuration.version}",
              },
            ]
          },

        ]
      },

    ]
  end
end