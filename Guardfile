# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'coffeescript', input: 'src', output: "vendor/assets/javascripts", bare: false

# guard :shell, all_on_start: false do

#   def execute_test(test_file, original_file_name)
#     res = `rake konacha:run SPEC=#{test_file}`
#     puts res
#     res.match(/(Finished in.+\n.+)/)
#     msg = "#{original_file_name}\n\n#{$1}"
#     if res.match(/\D0 failures/)
#       n(msg, "Test Passed!")
#     else
#       n(msg, "Test Failed!", :failed)
#     end
#     puts nil
#   end

#   def execute_all_tests
#     res = `rake konacha:run`
#     puts res
#     res.match(/(Finished in.+\n.+)/)
#     msg = "All JavaScript Tests\n\n#{$1}"
#     if res.match(/\D0 failures/)
#       n(msg, "Konacha Passed!")
#     else
#       n(msg, "Konacha Failed!", :failed)
#     end
#     puts nil
#   end

#   def clean_file(file)
#     exts = []

#     until File.extname(file) == ""
#       exts << File.extname(file)
#       file.gsub!(File.extname(file), "")
#     end

#     unless file.match(/_spec$/)
#       file << "_spec"
#     end
#     return file, exts.reverse
#   end

#   match_proc = ->(matches) {
#     m = matches[1]
#     return if m == "routes.js"

#     puts "#{m} was touched."

#     m, exts = clean_file(m)
#     test_file = "spec/javascripts/#{m}#{exts.join("")}"
#     if File.exists?(test_file)
#       execute_test(m, test_file)
#     else
#       execute_all_tests
#     end
#   }

#   watch(%r{^app\/assets\/javascripts/(.+(\.js|(\.js|)\.coffee))$}, &match_proc)

#   watch(%r{^spec\/javascripts\/(.+_spec(\.js|(\.js|)\.coffee))$}, &match_proc)
# end

# Run JS and CoffeeScript files in a typical Rails 3.1 fashion, placing Underscore templates in app/views/*.jst
# Your spec files end with _spec.{js,coffee}.

spec_location = "spec/javascripts/%s_spec"

# uncomment if you use NerdCapsSpec.js
# spec_location = "spec/javascripts/%sSpec"

guard 'jasmine-headless-webkit' do
  watch(%r{^src/(.*)\.(js|coffee)$}) { |m| newest_js_file(spec_location % m[1]) }
  watch(%r{^spec/javascripts/(.*)_spec\..*}) { |m| newest_js_file(spec_location % m[1]) }
end

