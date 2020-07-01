<%@ page contentType="text/html; charset=utf-8" %>

<section>
    <div id="map" style="width: 95%; height: 550px; margin-right: 5%;"></div>

    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=2f40abcb03a397dc715624e07f39732f&libraries=clusterer"></script>
    <script>
      var mapContainer = document.getElementById("map"), // ������ ǥ���� div
        mapOption = {
          center: new kakao.maps.LatLng(35.878044, 128.627612), // ������ �߽���ǥ
          level: 10, // ������ Ȯ�� ����
          mapTypeId: kakao.maps.MapTypeId.ROADMAP, // ��������
        };

      // ������ �����Ѵ�
      var map = new kakao.maps.Map(mapContainer, mapOption);
      // ��Ŀ Ŭ�����ͷ��� �����մϴ�
      var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // ��Ŀ���� Ŭ�����ͷ� �����ϰ� ǥ���� ���� ��ü
        averageCenter: true, // Ŭ�����Ϳ� ���Ե� ��Ŀ���� ��� ��ġ�� Ŭ������ ��Ŀ ��ġ�� ����
        minLevel: 10, // Ŭ������ �� �ּ� ���� ����
      });

      var imageSrc = "${pageContext.request.contextPath}/resources/imgs/good.png", // ��Ŀ�̹����� �ּ��Դϴ�
        imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
        imageOption = { offset: new kakao.maps.Point(27, 69) }; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

      // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
      var markerImage = new kakao.maps.MarkerImage(
        imageSrc,
        imageSize,
        imageOption
      );

      var data = [
        [35.878044, 128.627612, '<div style="padding:5px;">Hello World!</div>'],
        [35.879018, 128.626593, '<div style="padding:5px;">Hello World!</div>'],
        [35.879357, 128.628417, '<div style="padding:5px;">Hello World!</div>'],
      ];

      var markers = [];
      for (var i = 0; i < data.length; i++) {
        // ��Ŀ�� �����մϴ�
        var marker = new kakao.maps.Marker({
          position: new kakao.maps.LatLng(data[i][0], data[i][1]),
          image: markerImage,
        });

        // ���������츦 �����մϴ�
        var infowindow = new kakao.maps.InfoWindow({
          content: data[i][2],
        });

        // ��Ŀ ���� ���������츦 ǥ���մϴ�. �ι�° �Ķ������ marker�� �־����� ������ ���� ���� ǥ�õ˴ϴ�
        infowindow.open(map, marker);
        markers.push(marker);
        kakao.maps.event.addListener(
          marker,
          "mouseover",
          makeOverListener(map, marker, infowindow)
        );
        kakao.maps.event.addListener(
          marker,
          "mouseout",
          makeOutListener(infowindow)
        );
      }
      clusterer.addMarkers(markers);

      // ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ�
      function makeOverListener(map, marker, infowindow) {
        return function () {
          infowindow.open(map, marker);
        };
      }

      // ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ�
      function makeOutListener(infowindow) {
        return function () {
          infowindow.close();
        };
      }
    </script>
</section>