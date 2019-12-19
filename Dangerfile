github.dismiss_out_of_range_messages
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true, fail_on_error: true, additional_swiftlint_args: '--no-force-exclude'

'make synx'
synx_diff = 'git diff SwiftyKit.xcodeproj/project.pbxproj'
fail("'make synx'を実行すると差分が発生しました。'make synx'し'SwiftyKit.xcodeproj.project.pbxproj'の差分をコミットする必要があります。") unless synx_diff.empty?
