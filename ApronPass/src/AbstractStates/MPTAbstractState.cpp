#include <AbstractStates/MPTAbstractState.h>

#include <algorithm>

// MPTItemAbstractState

MPTItemAbstractState::MPTItemAbstractState(
		const std::set<std::string> & buffers, bool isWritable) :
				m_buffers(buffers), m_isWritable(isWritable) {}

MPTItemAbstractState::MPTItemAbstractState() : m_isWritable(true) {}

const std::set<std::string> & MPTItemAbstractState::getBuffers() {
	return m_buffers;
}

void MPTItemAbstractState::insert(std::string buffer) {
	if (m_isWritable) {
		m_buffers.insert(buffer);
	}
}

void MPTItemAbstractState::erase(std::string buffer) {
	if (m_isWritable) {
		m_buffers.erase(buffer);
	}
}

void MPTItemAbstractState::clear() {
	if (m_isWritable) {
		m_buffers.clear();
	}
}

std::set<std::string>::const_iterator MPTItemAbstractState::begin() const {
	return m_buffers.begin();
}

std::set<std::string>::const_iterator MPTItemAbstractState::end() const {
	return m_buffers.end();
}

bool MPTItemAbstractState::join(const MPTItemAbstractState & other) {
	bool isChanged = false;
	for (const std::string & userPtr : other.m_buffers) {
		auto inserted = m_buffers.insert(userPtr);
		isChanged = isChanged || inserted.second;
	}
	return isChanged;
}

bool MPTItemAbstractState::isProvablyNull() const {
	return (m_buffers.size() == 1) && (m_buffers.count("null") == 1);
}

bool MPTItemAbstractState::isProvablyKernel() const {
	return (m_buffers.size() == 1) && (m_buffers.count("kernel") == 1);
}

bool MPTItemAbstractState::empty() const {
	return m_buffers.empty();
}

bool MPTItemAbstractState::isWritable() const {
	return m_isWritable;
}

bool MPTItemAbstractState::contains(const std::string & name) const {
	return (m_buffers.count(name) == 1);
}

void MPTItemAbstractState::updateToIntersection(MPTItemAbstractState & left, MPTItemAbstractState & right) {
	std::set<std::string> intersection;
	std::set_intersection(left.begin(), left.end(), right.begin(), right.end(),
			std::inserter(intersection, intersection.end()));
	if (left.m_isWritable) {
		left.clear();
		left.m_buffers.insert(intersection.begin(), intersection.end());
	}
	if (right.m_isWritable) {
		right.clear();
		right.m_buffers.insert(intersection.begin(), intersection.end());
	}
}
// MPTAbstractState

MPTAbstractState::MPTAbstractState() {
	m_mayPointsTo.insert(std::make_pair("null",
			MPTItemAbstractState({"null"}, false)));
}

MPTAbstractState::MPTAbstractState(std::vector<std::string> buffers) {
	for (const std::string & buffer : buffers) {
		std::set<std::string> identBuffers;
		identBuffers.insert(buffer);
		m_mayPointsTo.insert(std::make_pair(
				buffer, MPTItemAbstractState(identBuffers, false)));
	}
	m_mayPointsTo.insert(std::make_pair("null",
			MPTItemAbstractState({"null"}, false)));
}

bool MPTAbstractState::join(const MPTAbstractState & other) {
	bool isChanged = false;
	for (auto & otherpt : other.m_mayPointsTo) {
		std::string name = otherpt.first;
		const MPTItemAbstractState & buffers = otherpt.second;
		auto pt_it = m_mayPointsTo.find(name);
		if (pt_it == m_mayPointsTo.end()) {
			isChanged = true;
			m_mayPointsTo.insert(std::make_pair(name, buffers));
		} else {
			isChanged = pt_it->second.join(buffers) || isChanged;
		}
	}
	return isChanged;
	
}

void MPTAbstractState::clear() {
	for (std::map<std::string, MPTItemAbstractState >::iterator it = m_mayPointsTo.begin(),
	                                                            ie = m_mayPointsTo.end();
			it != ie; it++) {
		MPTItemAbstractState & item = it->second;
		if (item.isWritable()) {
			it = m_mayPointsTo.erase(it);
		}
	}
}