object fmMaskHelp: TfmMaskHelp
  Left = 192
  Top = 107
  Width = 570
  Height = 471
  Caption = 'Edit Mask Picture Help'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 562
    Height = 437
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'Mask character'#9#9'Meaning'
      '#'#9#9#9'Permits a numeric character.'
      '?'#9#9#9'Permits an alphabetic character.'
      
        '&'#9#9#9'Permits an uppercase alphabetic character. If the character ' +
        'typed '
      
        'in is not in uppercase, it is automatically converted to upperca' +
        'se.'
      '@'#9#9#9'Permits any character.'
      
        '!'#9#9#9'Permits any character, and alphabetic characters should be i' +
        'n '
      
        'uppercase. If the character typed in is alphabetic and not in up' +
        'percase, it is automatically '
      'converted to uppercase.'
      '[ ]'#9#9#9'Defines a group of characters which is optional.'
      '{ }'#9#9#9'Defines a group of characters which is required.'
      
        ','#9#9#9'Separates alternatives in a group of characters. For instanc' +
        'e [#,?] '
      
        'stands for an optional numeric character or a alphabetic charact' +
        'er.'
      
        '-'#9#9#9'Used to define a range of characters. For instance, {a-z} st' +
        'ands for '
      
        'any lowercase letter in the range from a to z. A range of charac' +
        'ters should always be enclosed by { '
      '} or [ ].'
      
        '^'#9#9#9'Is used to define a complement range of characters. For inst' +
        'ance, '
      '{^a-z} stands for any character not in the range from a to z.'
      
        ';'#9#9#9'Escape character. Any character following the ; is treated a' +
        's a '
      
        'literal character, and should appear as such in the edit text. T' +
        'his escape character can be used to '
      
        'include the special picture mask characters as literals in the p' +
        'icture mask. For instance, {#,;#} '
      'allows a numeric character or a #.'
      
        '*'#9#9#9'Repeats the following character or group one or more times. ' +
        'The '
      
        'repeat character can optionally be followed by a number, specify' +
        'ing the number of times the '
      
        'following character or group should be repeated. For instance, *' +
        '# stands for one or more numeric '
      
        'characters, *[#] stands for zero or more numeric characters, *5{' +
        '#,?} stands for 5 alphanumeric '
      
        'characters, *5[#,?] stands for zero to five alphanumeric charact' +
        'ers.'
      
        '>'#9#9#9'Converts following characters to uppercase. The case convers' +
        'ion '
      
        'character takes precedence over the specified TextCase for the e' +
        'dit mask, but not over the ! mask '
      
        'character. Conversion is performed on data entry. Literal charac' +
        'ters included in the picture mask '
      
        'are not converted, but remain as they appear in the mask. The te' +
        'xt case is not enforced on exit '
      'from the cell.'
      
        '<'#9#9#9'Converts following characters to lowercase. The case convers' +
        'ion '
      
        'character takes precedence over the specified TextCase for the e' +
        'dit mask, but not over the ! mask '
      
        'character. Conversion is performed on data entry. Literal charac' +
        'ters included in the picture mask '
      
        'are not converted, but remain as they appear in the mask. The te' +
        'xt case is not enforced on exit '
      'from the cell.'
      
        '>>'#9#9#9'Same as the > case conversion character, but the text case ' +
        'is '
      
        'enforced on exit from the cell. If the characters in the edited ' +
        'text do not meet the required case, the '
      
        'value is considered invalid and the OnInvalidMaskValue is activa' +
        'ted.'
      
        '<<'#9#9#9'Same as the < case conversion character, but the text case ' +
        'is '
      
        'enforced on exit from the cell. If the characters in the edited ' +
        'text do not meet the required case, the '
      
        'value is considered invalid and the OnInvalidMaskValue is activa' +
        'ted.'
      
        '<>'#9#9#9'No case conversion is performed. The <> is used to end any ' +
        'case '
      
        'conversion started by the <, <<, > or >> case conversion charact' +
        'ers.'
      'The following examples illustrate the use of picture masks.'
      'Picture'#9#9#9'Meaning'
      
        '##/##/[##]##'#9#9'A date mask, with two digits for the month and day' +
        's, and either 2 or '
      '4 digits for the year.'
      
        '#*5[#][.##]'#9#9'A number mask, consisting of one to size digits, op' +
        'tionally followed by a '
      'decimal point and two digits.'
      '[a-z]'#9#9#9'Any character from a-z. The character is optional.'
      
        '{{a-z},{A-Z}}'#9#9'Any upper or lower case alphabetic character. The' +
        ' character is '
      'required.'
      
        '##:##[am,pm]'#9#9'A time mask, cosnsisting of two digits, followed b' +
        'y a '#39':'#39', followed by '
      'two more digits and optionally am or pm.'
      
        '>>*[?]'#9#9#9'Any sequence of uppercase alphabetic characters. While ' +
        'entering '
      
        'characters, lowercase characters are converted to uppercase. On ' +
        'exit from the cell, all characters '
      'must be in uppercase.'
      
        '>*[?]'#9#9#9'Any sequence of uppercase alphabetic characters. While e' +
        'ntering '
      
        'characters, lowercase characters are converted to uppercase. On ' +
        'exit from the cell, characters are '
      'not required to be in uppercase. '
      '(###) ### - ####'#9#9'Phone number mask.'
      
        '{Black,Blue,Green}'#9'Black, Blue or Green. While entering characte' +
        'rs, any literal uppercase '
      
        'character typed in as lowercase will be converted to uppercase, ' +
        'and any literal lowercase '
      'character to uppercase.'
      
        '*[{a-z],[A-Z],[0-9],;[,;]]'#9'Any string consisting of upper or low' +
        'ercase alphabetic characters, numeric '
      'characters, '#39'['#39' and '#39']'#39'.'
      
        '*5#.*2#'#9#9#9'Five digits, followed by a decimal point and two digit' +
        's.')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
