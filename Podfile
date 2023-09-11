# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Teamr' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  def shared_pods
    pod 'Kingfisher'
    pod 'TinyConstraints'
    pod 'Alamofire'
#    pod 'RealmSwift'
  end

  my_ws = 'Teamr'

  workspace my_ws
  abstract_target 'MyAppDependency' do
    shared_pods
    Xcodeproj::Workspace.new_from_xcworkspace("#{my_ws}.xcworkspace").file_references
     .select { |file| /^((?!Pods).)*\.xcodeproj/.match file.path }
     .map { |file| Xcodeproj::Project.open file.path }.each do |proj|
      proj.targets.each do |t|
        target t.name do
          project proj.path
        end
      end
    end
  end

end
