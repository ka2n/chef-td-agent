action :create do
    conf_name = new_resource.conf_name || new_resource.name

    template "/etc/td-agent/conf.d/#{conf_name}.conf" do
        owner 'td-agent'
        group 'td-agent'
        mode 0755
        source(new_resource.template || 'td-agent-block.conf.erb')
        cookbook new_resource.template ? new_resource.cookbook_name.to_s : 'td-agent'
        variables(
            :block => new_resource.block
        )
        backup false
    end

    new_resource.updated_by_last_action(true)
end

action :delete do
    conf_name = new_resource.conf_name || new_resource.name

    file "/etc/td-agent/conf.d/#{conf_name}" do
        action :delete
        notifies :restart, "service[td-agent]", :delayed
    end

    new_resource.updated_by_last_action(true)
end
