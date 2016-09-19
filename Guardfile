group :red_green_refactor, halt_on_fail: true do
  # Note: The cmd option is now required due to the increasing number of ways
  #       rspec may be run, below are examples of the most common uses.
  #  * bundler: 'bundle exec rspec'
  #  * bundler binstubs: 'bin/rspec'
  #  * spring: 'bin/rspec' (This will use spring if running and you have
  #                          installed the spring binstubs per the docs)
  #  * zeus: 'zeus rspec' (requires the server to be started separetly)
  #  * 'just' rspec: 'rspec'
  guard :rspec, cmd: 'bundle exec rspec --fail-fast' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { 'spec' }

    # Rails example
    watch(%r{^spec/factories/(.+)\.rb$})               { |_m| 'spec/models' }
    watch(%r{^app/(.+)\.rb$})                          { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})         { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
    watch(%r{^app/controllers/(.+)_(controller)\.rb$}) { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", 'spec/acceptance/#{m[1]}_spec.rb', 'spec/requests'] }
    watch(%r{^spec/support/(.+)\.rb$})                 { 'spec' }
    watch('config/routes.rb')                          { 'spec/routing' }
    watch('app/controllers/application_controller.rb') { 'spec/controllers' }
    watch('spec/rails_helper.rb')                      { 'spec' }

    # Capybara features specs
    watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})    { |m| ["spec/features/#{m[1]}_spec.rb", 'spec/features'] }
    watch(%r{^app/admin/(.+)\.rb$})                    { 'spec/features' }
    watch(%r{^app/resources/(.+)\.rb$})                { 'spec/requests' }
  end

  guard :rubocop, cli: ['--format', 'clang', '--rails', '--display-cop-names'] do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end
