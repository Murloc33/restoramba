#include "nearestrestaurantmodel.h"

#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QStringBuilder>
#include <QByteArray>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>

#define URL "http://91.222.238.209/restaurants/nearest"

NearestRestaurantModel::NearestRestaurantModel(QObject* parent)
	:QAbstractListModel(parent)
{
	get(56.8290526, 60.5887337);
}

void NearestRestaurantModel::get(double latitude, double longitude)
{
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
	}

	return QVariant();
}

RolesHash NearestRestaurantModel::roleNames() const
{
	RolesHash roles;
	roles[RestaurantNameRole]		= "name";
	roles[RestaurantRatingRole]			= "rating";
	roles[RestaurantDistanceRole]	= "distance";
	roles[RestaurantPhotoRole]	= "photo";

	return roles;
}

void NearestRestaurantModel::slotRequestCompleted()
{
	QNetworkReply* reply = qobject_cast<QNetworkReply *>(sender());
	if (reply->error() == QNetworkReply::NoError) {
		QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
		QJsonObject root = document.object();
		QJsonArray jsonArray = root.value("content").toArray();
		for (auto jsonElement : jsonArray)
		{
			QJsonObject jsonObject = jsonElement.toObject();
			RestaurantInfo newRestaurant;
			newRestaurant.name = jsonObject.value("name").toString();
			newRestaurant.rating = jsonObject.value("rating").toDouble();
			newRestaurant.distance = jsonObject.value("distance").toInt();
			newRestaurant.photo = jsonObject.value("photo").toString();
		}
	} else {
		qDebug() << "Error";
	}
	reply->deleteLater();
}
