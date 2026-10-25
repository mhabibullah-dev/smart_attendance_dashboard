import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const SmartAttendanceApp());
}

class SmartAttendanceApp extends StatelessWidget {
  const SmartAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Attendance Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF00897B),
          secondary: const Color(0xFFFFB300),
          surface: const Color(0xFF1A2E3B),
          onPrimary: Colors.white,
          onSurface: const Color(0xFFECEFF1),
        ),
        scaffoldBackgroundColor: const Color(0xFF0D1B2A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00695C),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00897B),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF243447),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF00897B), width: 1.2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF37474F), width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFFFB300), width: 2),
          ),
          labelStyle: const TextStyle(color: Color(0xFF90A4AE)),
          hintStyle: const TextStyle(color: Color(0xFF546E7A)),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFFECEFF1)),
          bodyMedium: TextStyle(color: Color(0xFFB0BEC5)),
          titleLarge: TextStyle(
            color: Color(0xFFECEFF1),
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      // Screen 1 is the entry point
      home: const StudentInfoScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  SCREEN 1 – Student Info Screen  (student.dart equivalent inside main.dart)
//  Layout widgets used: Column, Row, Container
//  Value  widgets used: Text, Icon, ElevatedButton
// ─────────────────────────────────────────────────────────────────────────────
class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  // ── Hardcoded student data ──────────────────────────────────────────────────
  static const String _studentName = 'M. Habib-Ullah';
  static const String _regNumber = '23-SE-034';
  static const String _session = '2023 – 2027';
  static const String _department = 'Software Engineering';
  static const String _university = 'UET Taxila';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        title: const Text(
          'Smart Attendance Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(Icons.school, color: Color(0xFFFFB300), size: 26),
          ),
        ],
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        // LAYOUT WIDGET 1 – Column: stacks all sections vertically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Profile Avatar Card ─────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: const Color(0xFF1A2E3B),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF00897B).withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Column(
                children: [
                  // Profile photo placeholder using CircleAvatar + Icon
                  CircleAvatar(
                    radius: 52,
                    backgroundColor: const Color(0xFF00897B).withOpacity(0.2),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundColor: Color(0xFF00695C),
                      // VALUE WIDGET – Icon used as profile photo stand-in
                      child: Icon(
                        Icons.person,
                        size: 52,
                        color: Color(0xFFECEFF1),
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // VALUE WIDGET – Student Name (Text)
                  const Text(
                    _studentName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFECEFF1),
                      letterSpacing: 0.4,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // VALUE WIDGET – Registration Number (Text)
                  const Text(
                    _regNumber,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFFFB300),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ── Info Cards Section ──────────────────────────────────────────
            const _InfoCard(
              icon: Icons.badge_outlined,
              label: 'Session',
              value: _session,
            ),
            const SizedBox(height: 14),
            const _InfoCard(
              icon: Icons.computer_outlined,
              label: 'Department',
              value: _department,
            ),
            const SizedBox(height: 14),
            const _InfoCard(
              icon: Icons.account_balance_outlined,
              label: 'University',
              value: _university,
            ),

            const SizedBox(height: 40),

            // ── Mark Attendance Button ──────────────────────────────────────
            // VALUE WIDGET – ElevatedButton that triggers navigation
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navigate to Screen 2, passing student name & reg number
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AttendanceScreen(
                        studentName: _studentName,
                        regNumber: _regNumber,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.check_circle_outline, size: 22),
                label: const Text('Mark Attendance'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF00897B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  REUSABLE INFO CARD WIDGET  (used on Screen 1)
//  LAYOUT WIDGET – Row: icon + label + value side by side
// ─────────────────────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // LAYOUT WIDGET 2 – Row: lays out icon and text horizontally
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2E3B),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF263238), width: 1),
      ),
      child: Row(
        children: [
          // VALUE WIDGET – Icon for each info category
          Icon(icon, color: const Color(0xFF00897B), size: 24),
          const SizedBox(width: 14),
          // VALUE WIDGET – Label Text
          Text(
            '$label: ',
            style: const TextStyle(
              color: Color(0xFF90A4AE),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          // VALUE WIDGET – Value Text
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFFECEFF1),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  SCREEN 2 – Attendance Screen
//  Layout widgets used: Column, Row, ListView, Expanded, SingleChildScrollView
//  Value  widgets used: Text, TextField, ElevatedButton, Icon
// ─────────────────────────────────────────────────────────────────────────────
class AttendanceScreen extends StatefulWidget {
  // Data received via navigation from Screen 1
  final String studentName;
  final String regNumber;

  const AttendanceScreen({
    super.key,
    required this.studentName,
    required this.regNumber,
  });

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // ── List of subjects (hardcoded as per requirement) ─────────────────────────
  final List<String> _subjects = [
    'E-Commerce',
    'Mobile App Development (MAD)',
    'SPM',
    'SPM Lab',
    'M&M',
    'Information Security (IS)',
  ];

  // ── Controllers for each subject row (total & attended) ────────────────────
  late final List<TextEditingController> _totalCtrl;
  late final List<TextEditingController> _attendedCtrl;

  // ── Per-subject attendance percentage (null = not yet calculated) ──────────
  late final List<double?> _subjectPercentage;

  // ── Overall attendance result ───────────────────────────────────────────────
  double? _overallAttendance;

  @override
  void initState() {
    super.initState();
    // Initialise controllers and percentage list for each subject
    _totalCtrl = List.generate(
      _subjects.length,
      (_) => TextEditingController(),
    );
    _attendedCtrl = List.generate(
      _subjects.length,
      (_) => TextEditingController(),
    );
    _subjectPercentage = List.filled(_subjects.length, null, growable: false);
  }

  @override
  void dispose() {
    // Dispose all controllers to free memory
    for (final c in _totalCtrl) {
      c.dispose();
    }
    for (final c in _attendedCtrl) {
      c.dispose();
    }
    super.dispose();
  }

  // ── Calculates attendance % for one subject ─────────────────────────────────
  void _calculateSubject(int index) {
    final int? total = int.tryParse(_totalCtrl[index].text.trim());
    final int? attended = int.tryParse(_attendedCtrl[index].text.trim());

    // Validate inputs before calculating
    if (total == null || attended == null || total <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers (total must be > 0).'),
          backgroundColor: Color(0xFFB71C1C),
        ),
      );
      return;
    }

    if (attended > total) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Attended lectures cannot exceed total lectures.'),
          backgroundColor: Color(0xFFB71C1C),
        ),
      );
      return;
    }

    // setState triggers Flutter to rebuild the widget tree with updated %
    setState(() {
      _subjectPercentage[index] = (attended / total) * 100;
      _overallAttendance = null; // reset overall when individual changes
    });
  }

  // ── Calculates overall average attendance across all subjects ───────────────
  void _calculateOverall() {
    // All subjects must have been individually calculated first
    if (_subjectPercentage.any((p) => p == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please calculate attendance for all subjects first.'),
          backgroundColor: Color(0xFFB71C1C),
        ),
      );
      return;
    }

    final double avg =
        _subjectPercentage.fold(0.0, (sum, p) => sum + p!) / _subjects.length;

    // setState causes Flutter to rebuild and show the overall result
    setState(() {
      _overallAttendance = avg;
    });
  }

  // ── Returns colour based on attendance percentage ───────────────────────────
  Color _percentageColor(double pct) {
    if (pct >= 75) return const Color(0xFF26A69A); // Teal  – Good
    if (pct >= 60) return const Color(0xFFFFB300); // Gold  – Average
    return const Color(0xFFEF5350); // Red   – Below threshold
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── AppBar shows "Attendance for [Student Name]" ─────────────────────
      appBar: AppBar(
        title: Text(
          'Attendance for ${widget.studentName}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ── Body: LAYOUT WIDGET – Column wrapping scroll + bottom button ─────
      body: Column(
        children: [
          // Scrollable portion (reg number card + subject list)
          // LAYOUT WIDGET 3 – Expanded: fills remaining vertical space
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Registration Number Card (non-editable) ───────────────
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A2E3B),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFF00897B).withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.badge_outlined,
                          color: Color(0xFFFFB300),
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Reg. Number:  ',
                          style: TextStyle(
                            color: Color(0xFF90A4AE),
                            fontSize: 14,
                          ),
                        ),
                        // VALUE WIDGET – non-editable TextField showing reg #
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(
                              text: widget.regNumber,
                            ),
                            readOnly: true, // Non-editable as required
                            style: const TextStyle(
                              color: Color(0xFFFFB300),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 1.1,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Subject-wise Attendance',
                    style: TextStyle(
                      color: Color(0xFFECEFF1),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.4,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── LAYOUT WIDGET 4 – ListView: renders all subject rows
                  //    shrinkWrap + NeverScrollableScrollPhysics because the
                  //    outer SingleChildScrollView handles scrolling.
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _subjects.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 14),
                    itemBuilder: (context, i) => _SubjectCard(
                      subjectName: _subjects[i],
                      totalCtrl: _totalCtrl[i],
                      attendedCtrl: _attendedCtrl[i],
                      percentage: _subjectPercentage[i],
                      percentColor: _subjectPercentage[i] != null
                          ? _percentageColor(_subjectPercentage[i]!)
                          : const Color(0xFF90A4AE),
                      onCalculate: () => _calculateSubject(i),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // ── Overall Attendance Section (pinned at bottom) ─────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2E3B),
              border: Border(
                top: BorderSide(
                  color: const Color(0xFF00897B).withOpacity(0.3),
                  width: 1.2,
                ),
              ),
            ),
            child: Column(
              children: [
                // VALUE WIDGET – ElevatedButton for overall calculation
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _calculateOverall,
                    icon: const Icon(Icons.bar_chart_rounded, size: 22),
                    label: const Text('Calculate Overall Attendance'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFB300), // Gold button
                      foregroundColor: const Color(0xFF0D1B2A),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // VALUE WIDGET – Text showing overall attendance result
                if (_overallAttendance != null) ...[
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: _percentageColor(
                        _overallAttendance!,
                      ).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _percentageColor(_overallAttendance!),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _overallAttendance! >= 75
                              ? Icons.check_circle
                              : Icons.warning_amber_rounded,
                          color: _percentageColor(_overallAttendance!),
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        // VALUE WIDGET – Text: final overall result display
                        Text(
                          'Overall Attendance: ${_overallAttendance!.toStringAsFixed(1)}%',
                          style: TextStyle(
                            color: _percentageColor(_overallAttendance!),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  SUBJECT CARD WIDGET  –  one card per subject in the ListView
//  LAYOUT WIDGET – Column + Row inside each card
// ─────────────────────────────────────────────────────────────────────────────
class _SubjectCard extends StatelessWidget {
  final String subjectName;
  final TextEditingController totalCtrl;
  final TextEditingController attendedCtrl;
  final double? percentage;
  final Color percentColor;
  final VoidCallback onCalculate;

  const _SubjectCard({
    required this.subjectName,
    required this.totalCtrl,
    required this.attendedCtrl,
    required this.percentage,
    required this.percentColor,
    required this.onCalculate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2E3B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: percentage != null
              ? percentColor.withOpacity(0.5)
              : const Color(0xFF263238),
          width: 1.4,
        ),
      ),
      // LAYOUT WIDGET – Column: subject name on top, inputs in middle, result at bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Subject Name Row ──────────────────────────────────────────────
          Row(
            children: [
              const Icon(
                Icons.book_outlined,
                color: Color(0xFF00897B),
                size: 20,
              ),
              const SizedBox(width: 8),
              // VALUE WIDGET – Subject name (Text)
              Expanded(
                child: Text(
                  subjectName,
                  style: const TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ── Input Row: Total | Attended ───────────────────────────────────
          // LAYOUT WIDGET – Row: two TextFields side by side
          Row(
            children: [
              // VALUE WIDGET – TextField for total lectures (number input)
              Expanded(
                child: TextField(
                  controller: totalCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Total Lectures',
                    prefixIcon: Icon(
                      Icons.list_alt,
                      color: Color(0xFF90A4AE),
                      size: 18,
                    ),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // VALUE WIDGET – TextField for attended lectures (number input)
              Expanded(
                child: TextField(
                  controller: attendedCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(
                    color: Color(0xFFECEFF1),
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Attended',
                    prefixIcon: Icon(
                      Icons.done_all,
                      color: Color(0xFF90A4AE),
                      size: 18,
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // ── Calculate Button + Result Row ─────────────────────────────────
          Row(
            children: [
              // VALUE WIDGET – ElevatedButton triggers per-subject calculation
              ElevatedButton(
                onPressed: onCalculate,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00695C),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(width: 14),

              // VALUE WIDGET – Text showing attendance % for this subject
              if (percentage != null)
                Expanded(
                  child: Text(
                    '${percentage!.toStringAsFixed(1)}%',
                    style: TextStyle(
                      color: percentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  EXPLANATION:
//
//  1. Layout Widgets: Column organises all UI sections top-to-bottom on both
//     screens. Row lays out the two TextFields (total / attended) side by side
//     in each subject card, and ListView stacks all subject cards vertically
//     inside a scrollable view. Expanded ensures widgets fill available space.
//
//  2. Value Widgets: Text displays static and dynamic data (student info,
//     attendance %). TextField captures numeric input from the user (total and
//     attended lectures). ElevatedButton triggers both per-subject and overall
//     calculations, and Icon provides visual cues for each info category.
//
//  3. Widget Rebuilding: setState() is called inside _calculateSubject() and
//     _calculateOverall(). Every setState() call marks the widget as "dirty",
//     causing Flutter to schedule a rebuild. During the rebuild the updated
//     _subjectPercentage list and _overallAttendance value are read from state,
//     so the Text widgets that render percentages automatically show the new
//     values — no manual DOM manipulation required, Flutter handles it all.
// ─────────────────────────────────────────────────────────────────────────────
