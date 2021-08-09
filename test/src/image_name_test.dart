import 'package:test/test.dart';
import 'package:docker2/docker2.dart';

void main() {
  test('image name ...', () async {
    var imageName = ImageName.fromName('ubuntu');
    expect(imageName.registry, isNull);
    expect(imageName.repository, isNull);
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.tag, isNull);

    imageName = ImageName.fromName('canonical/ubuntu');
    expect(imageName.registry, isNull);
    expect(imageName.repository, equals('canonical'));
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.tag, isNull);

    imageName = ImageName.fromName('docker.io/canonical/ubuntu');
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.repository, equals('canonical'));
    expect(imageName.registry, equals('docker.io'));
    expect(imageName.tag, isNull);

    imageName = ImageName.fromName('docker.io/canonical/ubuntu:latest');
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.repository, equals('canonical'));
    expect(imageName.registry, equals('docker.io'));
    expect(imageName.tag, equals('latest'));

    imageName = ImageName.fromName('docker.io/canonical/ubuntu:22.04');
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.repository, equals('canonical'));
    expect(imageName.registry, equals('docker.io'));
    expect(imageName.tag, equals('22.04'));

    imageName = ImageName.fromName('docker.io/ubuntu:22.04');
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.repository, isNull);
    expect(imageName.registry, equals('docker.io'));
    expect(imageName.tag, equals('22.04'));

    imageName = ImageName.fromName('docker.io/ubuntu');
    expect(imageName.name, equals('ubuntu'));
    expect(imageName.repository, isNull);
    expect(imageName.registry, equals('docker.io'));
    expect(imageName.tag, isNull);
  });
}