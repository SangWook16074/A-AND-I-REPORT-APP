import 'package:aandi_tech_blog/aandi_tech_blog.dart';
import 'package:aandi_web_bridge/aandi_web_bridge.dart';
import 'package:aandi_web_bridge/js_bridge.dart';

/// 빌드 타임 `-DAPI_URL=...`로 주입되는 API 서버 루트 URL입니다.
const _apiUrl = String.fromEnvironment(
  'API_URL',
  defaultValue: 'https://api.aandiclub.com',
);

/// `dart compile js`로 빌드되어 `web/app/aandi_bridge.js`로 서빙됩니다.
void main() {
  registerBridge(
    sitePolicy: SitePolicy(),
    blogService: BlogService(
      client: TechBlogApiClient(baseUrl: _apiUrl, deviceOs: 'web'),
    ),
  );
}
