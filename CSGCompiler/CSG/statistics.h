#ifndef CSG_STATISTICS
#define CSG_STATISTICS

#include <CSG/common.h>

namespace CSG {

    class Mesh;

    struct CSG_API Statistics {
	Statistics(const Mesh& mesh);
	void show();

	// geometry
	double area;
	double volume;

	// topology
	bool closed_and_manifold;
	int Xi;
	index_t nb_components;

	// mesh complexity
	index_t nb_vertices;
	index_t nb_edges;
	index_t nb_triangles;

	// mesh quality
	double min_angle;
	double max_angle;
	double avg_angle;
	double med_angle;
    };

}

#endif
