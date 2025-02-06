#!/bin/bash

if [ -z "$1" ]; then
  echo "❌ Введіть назву компонента!"
  exit 1
fi

COMPONENT_NAME=$1
COMPONENT_DIR="src/components/$COMPONENT_NAME"

mkdir -p $COMPONENT_DIR

cat > $COMPONENT_DIR/$COMPONENT_NAME.tsx <<EOF
import './$COMPONENT_NAME.scss';

const $COMPONENT_NAME: React.FC = () => {
  return (
    <div className='$COMPONENT_NAME'>
      <h2>$COMPONENT_NAME Component</h2>
    </div>
  );
};

export default $COMPONENT_NAME;
EOF

# стилі
cat > $COMPONENT_DIR/$COMPONENT_NAME.scss <<EOF
.$COMPONENT_NAME {
  /* Додай свої стилі тут */
}
EOF

# index.ts
cat > $COMPONENT_DIR/index.ts <<EOF
export { default } from './$COMPONENT_NAME';
EOF

echo "✅ Компонент $COMPONENT_NAME створено в $COMPONENT_DIR"
