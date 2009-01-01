require 'fileutils'

HOME = File.expand_path('~')
#
# interestingly, __FILE__ here is 'rakefile', rather than 'Rakefile'...
EXCLUDED = [ ".", "..", __FILE__, ".git", "Rakefile", "*.swp", "*.bak", "*~" ] 

desc "Install the dotfiles to ${HOME}"
task :install do
  Dir.glob("*", File::FNM_DOTMATCH).each do |file|
    next if EXCLUDED.inject(false) { |bool, pat| bool or File.fnmatch(pat, file, File::FNM_DOTMATCH) }
    target = File.join(HOME, file)
    if File.exist?(target)
      FileUtils.mv(target, "#{target}.bak", :force => true, :secure => true, :verbose => true)
    end
    FileUtils.cp_r(file, target, :preserve => true, :verbose => true)
  end
end
