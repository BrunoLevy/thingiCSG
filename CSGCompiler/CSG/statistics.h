#ifndef CSG_STATISTICS
#define CSG_STATISTICS

#include <CSG/common.h>
#include <filesystem>

namespace CSG {

    class Mesh;

    struct CSG_API Statistics {
        Statistics();
        void measure(const Mesh& mesh);
	void show();
	void append_stats_to_file(const std::filesystem::path& file);
	void load(
	    const std::filesystem::path& stats_file,
	    const std::filesystem::path& mesh_file
	);

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

	std::filesystem::path filename;
    };

}

#endif
