
import 'package:flutter/material.dart';

class KanbanBoardTwo extends StatefulWidget {
  const KanbanBoardTwo({super.key});

  @override
  State<KanbanBoardTwo> createState() => _KanbanBoardTwoState();
}

class _KanbanBoardTwoState extends State<KanbanBoardTwo> {
  final ScrollController _controller = ScrollController();
  final List<List<String>> _columns = [
    ['Task 1', 'Task 2'], // To Do
    ['Task 3'], // In Progress
    ['Task 4'], // Done
  ];
  final List<String> _columnTitles = ['To Do', 'In Progress', 'Done'];

  Widget _buildCard(String title, int columnIndex, int cardIndex) {
    return LongPressDraggable<Map<String, dynamic>>(
      data: {'title': title, 'columnIndex': columnIndex, 'cardIndex': cardIndex, 'type': 'card'},
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildColumn(int columnIndex) {
    return LongPressDraggable<Map<String, dynamic>>(
      data: {'columnIndex': columnIndex, 'type': 'column'},
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 300,
          height: 400, // Altura fixa para feedback visual
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _columnTitles[columnIndex],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
      childWhenDragging: Container(),
      child: DragTarget<Map<String, dynamic>>(
        onAcceptWithDetails: (data) {
          setState(() {
            final type = data.data['type'] as String;
            if (type == 'card') {
              final title = data.data['title'] as String;
              final oldColumnIndex = data.data['columnIndex'] as int;
              final oldCardIndex = data.data['cardIndex'] as int;
              _columns[oldColumnIndex].removeAt(oldCardIndex);
              _columns[columnIndex].add(title);
            } else if (type == 'column') {
              final oldColumnIndex = data.data['columnIndex'] as int;
              if (oldColumnIndex != columnIndex) {
                final movedColumn = _columns.removeAt(oldColumnIndex);
                final movedTitle = _columnTitles.removeAt(oldColumnIndex);
                _columns.insert(columnIndex, movedColumn);
                _columnTitles.insert(columnIndex, movedTitle);
              }
            }
          });
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            width: 300,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _columnTitles[columnIndex],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _columns[columnIndex].length,
                    itemBuilder: (context, index) {
                      return DragTarget<Map<String, dynamic>>(
                        onAcceptWithDetails: (data) {
                          setState(() {
                            final type = data.data['type'] as String;
                            if (type == 'card') {
                              final title = data.data['title'] as String;
                              final oldColumnIndex = data.data['columnIndex'] as int;
                              final oldCardIndex = data.data['cardIndex'] as int;
                              _columns[oldColumnIndex].removeAt(oldCardIndex);
                              _columns[columnIndex].insert(index, title);
                            }
                          });
                        },
                        builder: (context, candidateData, rejectedData) {
                          return _buildCard(_columns[columnIndex][index], columnIndex, index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            _columns.length,
                (index) => _buildColumn(index),
          ),
        ),
      ),
    );
  }
}