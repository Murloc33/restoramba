#ifndef NEARESTRESTAURANTMODEL_H
#define NEARESTRESTAURANTMODEL_H

#include <QAbstractListModel>
#include <QString>

typedef QHash<int, QByteArray> RolesHash;

class NearestRestaurantModel: public QAbstractListModel
{
	Q_OBJECT

public:
	enum Roles {
		RestaurantNameRole = Qt::UserRole + 1,
		RestaurantRatingRole,
		RestaurantDistanceRole,
        RestaurantPhotoRole,
        RestaurantStarRole,
        RestaurantRatingStrRole
	};
	Q_ENUM(Roles)

public:
	NearestRestaurantModel(QObject* parent = nullptr);

	void get(double latitude, double longitude);

	int rowCount(const QModelIndex &parent) const;
	QVariant data(const QModelIndex &index, int role) const;

	RolesHash roleNames() const override;

	struct RestaurantInfo {
        QString ratingStr;
		QString name;
        double rating;
        QString distance;
		QString photo;
        QString star;
	};

private:
	void slotRequestCompleted();

private:
	QVector<RestaurantInfo> m_nearestRestaurant;

};
#endif // NEARESTRESTAURANTMODEL_H
