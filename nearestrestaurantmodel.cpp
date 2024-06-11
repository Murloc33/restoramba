#include "nearestrestaurantmodel.h"

#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QStringBuilder>
#include <QByteArray>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>
#include <QSslSocket>
#include <QGeoPositionInfo>

#define URL "http://91.222.238.209/restaurants/nearest"

NearestRestaurantModel::NearestRestaurantModel(QObject* parent)
	:QAbstractListModel(parent)
{
    // QGeoPositionInfo positionInfo;
    // if (positionInfo.isValid()) {
    //     double latitude = positionInfo.coordinate().latitude();
    //     double longitude = positionInfo.coordinate().longitude();
    //     qDebug() << "Latitude: " << latitude;
    //     qDebug() << "Longitude: " << longitude;
    // } else {
    //     qDebug() << "Failed to get geographical position";
    // }

    get(56.828493, 60.588545);
}

void NearestRestaurantModel::get(double latitude, double longitude)
{
	qInfo() << QSslSocket::sslLibraryBuildVersionString();
	qInfo() << QSslSocket::sslLibraryVersionString();
	QNetworkRequest request;
	QString params = QString("?latitude=%1&longitude=%2").arg(latitude).arg(longitude);
	request.setUrl(QUrl(URL + params));

	QNetworkAccessManager *manager = new QNetworkAccessManager(this);
	QNetworkReply* reply = manager->get(request);
	connect(reply, &QNetworkReply::finished, this, &NearestRestaurantModel::slotRequestCompleted);
}

int NearestRestaurantModel::rowCount(const QModelIndex &parent) const
{
	Q_UNUSED(parent)
	return m_nearestRestaurant.size();
}

QVariant NearestRestaurantModel::data(const QModelIndex &index, int role) const
{
	if (!index.isValid()) {
		return QVariant();
	}

	const RestaurantInfo &restaurantInfo = m_nearestRestaurant[index.row()];

	switch (role) {
	case RestaurantNameRole:
		return QVariant::fromValue(restaurantInfo.name);
	case RestaurantRatingRole:
		return QVariant::fromValue(restaurantInfo.rating);
	case RestaurantDistanceRole:
		return QVariant::fromValue(restaurantInfo.distance);
	case RestaurantPhotoRole:
		return QVariant::fromValue(restaurantInfo.photo);
    case RestaurantStarRole:
        return QVariant::fromValue(restaurantInfo.star);
    case RestaurantRatingStrRole:
        return QVariant::fromValue(restaurantInfo.ratingStr);
	}

	return QVariant();
}

RolesHash NearestRestaurantModel::roleNames() const
{
	RolesHash roles;
	roles[RestaurantNameRole]	  = "name";
	roles[RestaurantRatingRole]	  = "rating";
	roles[RestaurantDistanceRole] = "distance";
	roles[RestaurantPhotoRole]	  = "photo";
    roles[RestaurantStarRole]     = "star";
    roles[RestaurantRatingStrRole]= "ratingStr";

	return roles;
}

void NearestRestaurantModel::slotRequestCompleted()
{
	QNetworkReply* reply = qobject_cast<QNetworkReply *>(sender());
	if (reply->error() == QNetworkReply::NoError) {
		beginResetModel();
		QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
		QJsonObject root = document.object();
		QJsonArray jsonArray = root.value("content").toArray();
		for (auto jsonElement : jsonArray)
		{
			QJsonObject jsonObject = jsonElement.toObject();
			RestaurantInfo newRestaurant;

            newRestaurant.name = "<b>" + jsonObject.value("name").toString() + "<b>";
			newRestaurant.rating = jsonObject.value("rating").toDouble();
            newRestaurant.distance = tr("%1 метров").arg(jsonObject.value("distance").toInt());
            newRestaurant.photo = jsonObject.value("photo").toString();

            if (newRestaurant.rating >= 4) {
                newRestaurant.star = "Images/goodStar.png";
                newRestaurant.ratingStr = "Отлично";
            } else if (newRestaurant.rating >= 3) {
                newRestaurant.star = "Images/goodStar.png";
                newRestaurant.ratingStr = "Хорошо";
            } else {
                newRestaurant.star = "Images/goodStar.png";
                newRestaurant.ratingStr = "Плохо";
            }
			qDebug() << newRestaurant.name << newRestaurant.rating << newRestaurant.distance << newRestaurant.photo ;
			m_nearestRestaurant.append(newRestaurant);
		}
		endResetModel();
	} else {
		qDebug() << "Error";
	}
	reply->deleteLater();
}
