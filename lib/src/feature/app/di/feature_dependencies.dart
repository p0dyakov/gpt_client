import 'package:gpt_client/src/core/di/app_dependencies.dart';
import 'package:gpt_client/src/core/di/shared_parent.dart';
import 'package:gpt_client/src/feature/app/di/app_feature_dependencies.dart';
import 'package:gpt_client/src/feature/chat/di/chat_dependencies.dart';
import 'package:gpt_client/src/feature/settings/di/settings_dependencies.dart';

class FeatureDependenciesModule<P extends SharedParent<P>>
    extends SharedBaseModule<FeatureDependenciesModule<P>, P>
    implements FeatureDependencies {
  FeatureDependenciesModule(super.parent);

  @override
  AppFeatureDependencies get app =>
      module<AppFeatureModule<FeatureDependenciesModule<P>>>(
        AppFeatureModule.new,
      );

  @override
  SettingsDependencies get settings =>
      module<SettingsDependenciesModule<FeatureDependenciesModule<P>>>(
        SettingsDependenciesModule.new,
      );

  @override
  ChatDependencies get chat =>
      module<ChatDependenciesModule<FeatureDependenciesModule<P>>>(
        ChatDependenciesModule.new,
      );
}
