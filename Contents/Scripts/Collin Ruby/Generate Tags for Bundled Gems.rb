#!/usr/bin/env ruby

def display_dialog(text)
  system "osascript -e 'display dialog \"#{text}\"' &2>/dev/null"
end

def display_missing_gemfile_dialog
  display_dialog 'Not a Gemfile'
end

def gemfile_path
  doc_path = ENV['BB_DOC_PATH']
  if !doc_path.nil? and File.basename(doc_path) == 'Gemfile'
    doc_path
  end
end

unless gemfile_path.nil?
  Dir.chdir(File.dirname gemfile_path) do
    require 'bundler'
    paths = Bundler.load.specs.map(&:full_gem_path).join(' ')
    system <<-EOS
    if hash 'ripper-tags' 2>/dev/null; then
      CTAGS="ripper-tags"
    elif hash 'ctags' 2>/dev/null; then
      CTAGS="ctags"
    else
      system "osascript -e 'display alert \"No ctags executable found. Please install ripper-tags or ctags.\"' &2>/dev/null"
    fi
    $CTAGS -R -f gems.tags #{paths}
    EOS
  end
else
  display_missing_gemfile_dialog
end
