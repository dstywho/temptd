# A sample Guardfile
# More info at https://github.com/guard/guard#readme


guard 'spork', :wait => 40, :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end


# :all_on_start => false prevents rspec from running all the specs when guard starts
#   that is what rake spec (or rake) is for
#
guard 'rspec', :version => 2, :cli => '--drb', :all_on_start => false do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }

  # Rails example
  watch('spec/spec_helper.rb')                       { "spec" }
  watch('config/routes.rb')                          { "spec/routing" }
  watch('app/controllers/application_controller.rb') { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^app/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  
  # this runs specs after factories.rb is updated
  watch(%r{^spec/factories\.rb$}) { "spec" }
  watch(%r{^spec/factories/(.+)_factory\.rb$}) do |m| 
    ["spec/models/#{m[1]}_spec.rb", 
     "spec/controllers/#{m[1].pluralize}_controller_spec.rb", 
     "spec/requests/#{m[1].pluralize}_spec.rb"] 
  end
end

# # Cucumber also has the :all_on_start option
# #
# cucumber_cli = if ENV["FOCUS_CUCUMBER"]
#   "--drb -pfocus"
# else
#   "--drb"
# end
# guard 'cucumber', :cli => cucumber_cli, :all_on_start => false do
#   watch(%r{features/.+\.feature})
#   watch(%r{features/support/.+})          { 'features' }
#   if ENV["FOCUS_CUCUMBER"]
#     puts "**** Ignoring changes to step definitions"
#   else
#     watch(%r{features/step_definitions/(.+)_steps\.rb}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
#   end
# end
# 
# # watch for changes in the app/coffeescripts directory and send compiled javascript to public/javascripts/compiled
# #  This does for test environments what barista does for other environments
# guard 'coffeescript', :output => 'public/javascripts/compiled' do
#   watch(%r{^app/coffeescripts/(.*)\.coffee})
# end
# 
# # watch for changes in jasmine specs written in coffeescript and send compiled javascript to spec/javascripts
# guard 'coffeescript', :output => 'spec/javascripts' do
#   watch(%r{^spec/coffeescripts/(.*)\.coffee})
# end
# 
# # the :apply_js_live => false gets passed on to livereload
# # It causes the whole page to be reloaded when javascript changes, 
# guard 'livereload', :apply_js_live => false do
#   watch(%r{^spec/javascripts/.+\.js$})
#   watch(%r{^public/javascripts/compiled/.+\.js$})
# end
