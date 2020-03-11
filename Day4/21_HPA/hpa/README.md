
# Beta version

```yaml
apiVersion: autoscaling/v2beta1
kind: HorizontalPodAutoscaler
metadata:
  name: resize-hpa
  namespace: resize
spec:
  scaleTargetRef:
    apiVersion: apps/v1beta1
    kind: Deployment
    name: image-resizer
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: memory
      targetAverageUtilization: 60

```