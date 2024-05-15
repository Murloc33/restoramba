#ifndef HTTPREQUEST_H
#define HTTPREQUEST_H

#include <QString>
#include <QVector>

class HttpRequest
{
public:
	HttpRequest();

	void get(const QString &ip);

private:
	QVector<Tile> m_rawBoard;
	const size_t m_dimension;
	const size_t m_boardSize;

};

#endif // HTTPREQUEST_H
