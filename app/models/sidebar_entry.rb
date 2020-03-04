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
                href: '#',
                title: 'Build Notes',
                subtitle: "v#{Rails.configuration.version}",
              },
            ]
          },
          {
            href: '#',
            title: 'Theme Settings',
            icon: 'fa-cog',
            children: [
              {
                href: '#',
                title: 'How it works',
              },
              {
                href: '#',
                title: 'Layout Options',
              },
              {
                href: '#',
                title: 'Skin Options',
              },
              {
                href: '#',
                title: 'Saving to Database',
              },
            ]
          },
          {
            href: '#',
            title: 'Package Info',
            icon: 'fa-tag',
            children: [
              {
                href: '#',
                title: 'Product Licensing',
              },
              {
                href: '#',
                title: 'Different Flavors',
              },
            ]
          },
        ]
      },
      {
        group_title: 'Tools & Components',
        children: [
          {
            href: '#',
            title: 'UI Components',
            icon: 'fa-window',
            children: [
              {
                href: '#',
                title: 'Alerts',
              },
              {
                href: '#',
                title: 'Accordions',
              },
              {
                href: '#',
                title: 'Badges',
              },
              {
                href: '#',
                title: 'Breadcrumbs',
              },
              {
                href: '#',
                title: 'Buttons',
              },
              {
                href: '#',
                title: 'Button Group',
              },
              {
                href: '#',
                title: 'Cards',
              },
              {
                href: '#',
                title: 'Carousel',
              },
              {
                href: '#',
                title: 'Collapse',
              },
              {
                href: '#',
                title: 'Dropdowns',
              },
              {
                href: '#',
                title: 'List Filter',
              },
              {
                href: '#',
                title: 'Modal',
              },
              {
                href: '#',
                title: 'Navbars',
              },
              {
                href: '#',
                title: 'Panels',
              },
              {
                href: '#',
                title: 'Pagination',
              },
              {
                href: '#',
                title: 'Popovers',
              },
              {
                href: '#',
                title: 'Progress Bars',
              },
              {
                href: '#',
                title: 'ScrollSpy',
              },
              {
                href: '#',
                title: 'Side Panel',
              },
              {
                href: '#',
                title: 'Spinners',
              },
              {
                href: '#',
                title: 'Tabs & Pills',
              },
              {
                href: '#',
                title: 'Toasts',
              },
              {
                href: '#',
                title: 'Tooltips',
              },
            ]
          },
          {
            href: '#',
            title: 'Utilities',
            icon: 'fa-bolt',
            children: [
              {
                href: '#',
                title: 'Borders',
              },
              {
                href: '#',
                title: 'Clearfix',
              },
              {
                href: '#',
                title: 'Color Pallet',
              },
              {
                href: '#',
                title: 'Display Property',
              },
              {
                href: '#',
                title: 'Fonts',
              },
              {
                href: '#',
                title: 'Flexbox',
              },
              {
                href: '#',
                title: 'Helpers',
              },
              {
                href: '#',
                title: 'Position',
              },
              {
                href: '#',
                title: 'Responsive Grid',
              },
              {
                href: '#',
                title: 'Sizing',
              },
              {
                href: '#',
                title: 'Spacing',
              },
              {
                href: '#',
                title: 'Typography',
              },
              {
                href: 'javascript:void(0);',
                title: 'Menu child',
                children: [
                  {
                    href: 'javascript:void(0);',
                    title: 'Sublevel Item',
                  },
                  {
                    href: 'javascript:void(0);',
                    title: 'Another Item',
                  },
                ]
              },
              {
                href: 'javascript:void(0);',
                title: 'Disabled item',
                disabled: true
              },
            ]
          },
          {
            href: '#',
            title: 'Font Icons',
            subtitle: '2,500+',
            subtitle_class: 'dl-ref bg-primary-500 hidden-nav-function-minify hidden-nav-function-top',
            icon: 'fa-map-marker-alt',
            children: [
              {
                href: 'javascript:void(0);',
                title: 'FontAwesome Pro',
                children: [
                  {
                    href: '#',
                    title: 'Light',
                  },
                  {
                    href: '#',
                    title: 'Regular',
                  },
                  {
                    href: '#',
                    title: 'Solid',
                  },
                  {
                    href: '#',
                    title: 'Brand',
                  },
                ]
              },
              {
                href: 'javascript:void(0);',
                title: 'NextGen Icons',
                children: [
                  {
                    href: '#',
                    title: 'General',
                  },
                  {
                    href: '#',
                    title: 'Base',
                  },
                ]
              },
              {
                href: 'javascript:void(0);',
                title: 'Stack Icons',
                children: [
                  {
                    href: '#',
                    title: 'Showcase',
                  },
                  {
                    href: '#',
                    title: 'Generate Stack',
                  },
                ]
              },
            ]
          },
          {
            href: '#',
            title: 'Tables',
            icon: 'fa-th-list',
            children: [
              {
                href: '#',
                title: 'Basic Tables',
              },
              {
                href: '#',
                title: 'Generate Table Style',
              },
            ]
          },
          {
            href: '#',
            title: 'Form Stuff',
            icon: 'fa-edit',
            children: [
              {
                href: '#',
                title: 'Basic Inputs',
              },
              {
                href: '#',
                title: 'Checkbox & Radio',
              },
              {
                href: '#',
                title: 'Input Groups',
              },
              {
                href: '#',
                title: 'Validation',
              },
            ]
          },
        ]
      },
      {
        group_title: 'Plugins & Addons',
        children: [
          {
            href: '#',
            title: 'Core Plugins',
            icon: 'fa-shield-alt',
            children: [
              {
                href: '#',
                title: 'Plugins FAQ',
              },
              {
                href: '#',
                title: 'Waves',
                subtitle: '9 KB',
                subtitle_class: 'dl-ref label bg-primary-400 ml-2',
              },
              {
                href: '#',
                title: 'PaceJS',
                subtitle: '13 KB',
                subtitle_class: 'dl-ref label bg-primary-500 ml-2',
              },
              {
                href: '#',
                title: 'SmartPanels',
                subtitle: '9 KB',
                subtitle_class: 'dl-ref label bg-primary-600 ml-2',
              },
              {
                href: '#',
                title: 'BootBox',
                subtitle: '15 KB',
                subtitle_class: 'dl-ref label bg-primary-600 ml-2',
              },
              {
                href: '#',
                title: 'Slimscroll',
                subtitle: '5 KB',
                subtitle_class: 'dl-ref label bg-primary-700 ml-2',
              },
              {
                href: '#',
                title: 'Throttle',
                subtitle: '1 KB',
                subtitle_class: 'dl-ref label bg-primary-700 ml-2',
              },
              {
                href: '#',
                title: 'Navigation',
                subtitle: '2 KB',
                subtitle_class: 'dl-ref label bg-primary-700 ml-2',
              },
              {
                href: '#',
                title: 'i18next',
                subtitle: '10 KB',
                subtitle_class: 'dl-ref label bg-primary-700 ml-2',
              },
              {
                href: '#',
                title: 'App.Core',
                subtitle: '14 KB',
                subtitle_class: 'dl-ref label bg-success-700 ml-2',
              },
            ]
          },
        ]
      },
      {
        group_title: 'Layouts & Apps',
        children: [
          {
            href: '#',
            title: 'Page Views',
            icon: 'fa-plus-circle',
            children: [
              {
                href: '#',
                title: 'Chat',
              },
              {
                href: '#',
                title: 'Contacts',
              },
              {
                href: 'javascript:void(0);',
                title: 'Forum',
                children: [
                  {
                    href: '#',
                    title: 'List',
                  },
                  {
                    href: '#',
                    title: 'Threads',
                  },
                  {
                    href: '#',
                    title: 'Discussion',
                  },
                ]
              },
              {
                href: 'javascript:void(0);',
                title: 'Inbox',
                children: [
                  {
                    href: '#',
                    title: 'General',
                  },
                  {
                    href: '#',
                    title: 'Read',
                  },
                  {
                    href: '#',
                    title: 'Write',
                  },
                ]
              },
              {
                href: '#',
                title: 'Invoice (printable)',
              },
              {
                href: 'javascript:void(0);',
                title: 'Authentication',
                children: [
                  {
                    href: '#',
                    title: 'Forget Password',
                  },
                  {
                    href: '#',
                    title: 'Locked Screen',
                  },
                  {
                    href: '#',
                    title: 'Login',
                  },
                  {
                    href: '#',
                    title: 'Login Alt',
                  },
                  {
                    href: '#',
                    title: 'Register',
                  },
                  {
                    href: '#',
                    title: 'Confirmation',
                  },
                ]
              },
              {
                href: 'javascript:void(0);',
                title: 'Error Pages',
                children: [
                  {
                    href: '#',
                    title: 'General Error',
                  },
                  {
                    href: '#',
                    title: 'Server Error',
                  },
                  {
                    href: '#',
                    title: 'Announced Error',
                  },
                ]
              },
              {
                href: '#',
                title: 'Profile',
              },
              {
                href: '#',
                title: 'Search Results',
              },
            ]
          },
        ]
      },
    ]
  end
end