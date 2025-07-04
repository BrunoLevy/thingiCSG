#ifndef CSG_STATISTICS
#define CSG_STATISTICS

#include <CSG/common.h>

namespace CSG {

    class Mesh;

    struct CSG_API Statistics {
        Statistics();
        void measure(const Mesh& mesh);
	void show();

        Stopwatch W;
       
	// geometry
	double area;
	double volume;

	// topology
	bool closed;
	bool manifold;
	int Xi;
	index_t nb_components;

	// mesh complexity
	index_t nb_vertices;
	index_t nb_edges;
	index_t nb_triangles;

        double elapsed_time;
    };

}

#endif
