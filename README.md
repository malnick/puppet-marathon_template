# Puppet marathon_template 
Provisions malnick/marathon_template.git

## Pattern

```ruby
class { ::marathon_template:
  template_location => 'my_corp_profiles/haproxy.yaml.erb',
}
```

